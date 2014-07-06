/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.qpid.proton.jms;

import org.apache.qpid.proton.amqp.messaging.Section;
import org.apache.qpid.proton.codec.CompositeWritableBuffer;
import org.apache.qpid.proton.codec.WritableBuffer;
import org.apache.qpid.proton.codec.DroppingWritableBuffer;
import org.apache.qpid.proton.message.ProtonJMessage;
import org.apache.qpid.proton.message.impl.MessageFactoryImpl;
import org.apache.qpid.proton.amqp.Binary;
import org.apache.qpid.proton.amqp.Symbol;
import org.apache.qpid.proton.amqp.UnsignedByte;
import org.apache.qpid.proton.amqp.UnsignedInteger;
import org.apache.qpid.proton.amqp.messaging.*;

import javax.jms.*;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;

/**
* @author <a href="http://hiramchirino.com">Hiram Chirino</a>
*/
public class JMSMappingOutboundTransformer extends OutboundTransformer {

    private static final MessageFactoryImpl MESSAGE_FACTORY = new MessageFactoryImpl();

    String prefixDeliveryAnnotations = "DA_";
    String prefixMessageAnnotations= "MA_";
    String prefixFooter = "FT_";

    public JMSMappingOutboundTransformer(JMSVendor vendor) {
        super(vendor);
    }

    @Override
    public EncodedMessage transform(Message msg) throws Exception {
        if( msg == null )
            return null;
        try {
            if( msg.getBooleanProperty(prefixVendor + "NATIVE") ) {
                return null;
            }
        } catch (MessageFormatException e) {
            return null;
        }
        return transform(this, msg);
    }

    static EncodedMessage transform(JMSMappingOutboundTransformer options, Message msg) throws JMSException, UnsupportedEncodingException {
        final JMSVendor vendor = options.vendor;

        final String messageFormatKey = options.prefixVendor + "MESSAGE_FORMAT";
        final String nativeKey = options.prefixVendor + "NATIVE";
        final String firstAcquirerKey = options.prefixVendor + "FirstAcquirer";
        final String prefixDeliveryAnnotationsKey = options.prefixVendor + options.prefixDeliveryAnnotations;
        final String prefixMessageAnnotationsKey = options.prefixVendor + options.prefixMessageAnnotations;
        final String subjectKey =  options.prefixVendor +"Subject";
        final String contentTypeKey = options.prefixVendor +"ContentType";
        final String contentEncodingKey = options.prefixVendor +"ContentEncoding";
        final String replyToGroupIDKey = options.prefixVendor +"ReplyToGroupID";
        final String prefixFooterKey = options.prefixVendor + options.prefixFooter;

        long messageFormat;
        try {
            messageFormat = msg.getLongProperty(messageFormatKey);
        } catch (MessageFormatException e) {
            return null;
        }

        Header header = new Header();
        Properties props=new Properties();
        HashMap daMap = null;
        HashMap maMap = null;
        HashMap apMap = null;
        Section body=null;
        HashMap footerMap = null;
        if( msg instanceof BytesMessage ) {
            BytesMessage m = (BytesMessage)msg;
            byte data[] = new byte[(int) m.getBodyLength()];
            m.readBytes(data);
            body = new Data(new Binary(data));
        } if( msg instanceof TextMessage ) {
            body = new AmqpValue(((TextMessage) msg).getText());
        } if( msg instanceof MapMessage ) {
            final HashMap map = new HashMap();
            final MapMessage m = (MapMessage) msg;
            final Enumeration names = m.getMapNames();
            while (names.hasMoreElements()) {
                String key = (String) names.nextElement();
                map.put(key, m.getObject(key));
            }
            body = new AmqpValue(map);
        } if( msg instanceof StreamMessage ) {
            ArrayList list = new ArrayList();
            final StreamMessage m = (StreamMessage) msg;
            try {
                while(true) {
                    list.add(m.readObject());
                }
            } catch(MessageEOFException e){}
            body = new AmqpSequence(list);
        } if( msg instanceof ObjectMessage ) {
            body = new AmqpValue(((ObjectMessage) msg).getObject());
        }

        header.setDurable(msg.getJMSDeliveryMode() == DeliveryMode.PERSISTENT ? true : false);
        header.setPriority(new UnsignedByte((byte) msg.getJMSPriority()));
        if( msg.getJMSExpiration() != 0 ) {
            header.setTtl(new UnsignedInteger((int) msg.getJMSExpiration()));
        }
        if( msg.getJMSType()!=null ) {
            if( maMap==null ) maMap = new HashMap();
            maMap.put("x-opt-jms-type", msg.getJMSType());
        }
        if( msg.getJMSMessageID()!=null ) {
            props.setMessageId(msg.getJMSMessageID());
        }
        if( msg.getJMSDestination()!=null ) {
            props.setTo(vendor.toAddress(msg.getJMSDestination()));
            if( maMap==null ) maMap = new HashMap();
            maMap.put("x-opt-to-type", destinationAttributes(msg.getJMSDestination()));
        }
        if( msg.getJMSReplyTo()!=null ) {
            props.setReplyTo(vendor.toAddress(msg.getJMSReplyTo()));
            if( maMap==null ) maMap = new HashMap();
            maMap.put("x-opt-reply-type", destinationAttributes(msg.getJMSReplyTo()));
        }
        if( msg.getJMSCorrelationID()!=null ) {
            props.setCorrelationId(msg.getJMSCorrelationID());
        }
        if( msg.getJMSExpiration() != 0 ) {
            props.setAbsoluteExpiryTime(new Date(msg.getJMSExpiration()));
        }
        if( msg.getJMSTimestamp()!= 0 ) {
            props.setCreationTime(new Date(msg.getJMSTimestamp()));
        }

        final Enumeration keys = msg.getPropertyNames();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            if( key.equals(messageFormatKey) || key.equals(nativeKey)) {
                // skip..
            } else if( key.equals(firstAcquirerKey) ) {
                header.setFirstAcquirer(msg.getBooleanProperty(key));
            } else if( key.startsWith("JMSXDeliveryCount") ) {
                header.setDeliveryCount(new UnsignedInteger(msg.getIntProperty(key)));
            } else if( key.startsWith("JMSXUserID") ) {
                String value = msg.getStringProperty(key);
                props.setUserId(new Binary(value.getBytes("UTF-8")));
            } else if( key.startsWith("JMSXGroupID") ) {
                String value = msg.getStringProperty(key);
                props.setGroupId(value);
                if( apMap==null ) apMap = new HashMap();
                apMap.put(key, value);
            } else if( key.startsWith("JMSXGroupSeq") ) {
                UnsignedInteger value = new UnsignedInteger(msg.getIntProperty(key));
                props.setGroupSequence(value);
                if( apMap==null ) apMap = new HashMap();
                apMap.put(key, value);
            } else if( key.startsWith(prefixDeliveryAnnotationsKey) ) {
                if( daMap == null ) daMap = new HashMap();
                String name = key.substring(prefixDeliveryAnnotationsKey.length());
                daMap.put(name, msg.getObjectProperty(key));
            } else if( key.startsWith(prefixMessageAnnotationsKey) ) {
                if( maMap==null ) maMap = new HashMap();
                String name = key.substring(prefixMessageAnnotationsKey.length());
                maMap.put(name, msg.getObjectProperty(key));
            } else if( key.equals(subjectKey) ) {
                props.setSubject(msg.getStringProperty(key));
            } else if( key.equals(contentTypeKey) ) {
                props.setContentType(Symbol.getSymbol(msg.getStringProperty(key)));
            } else if( key.equals(contentEncodingKey) ) {
                props.setContentEncoding(Symbol.getSymbol(msg.getStringProperty(key)));
            } else if( key.equals(replyToGroupIDKey) ) {
                props.setReplyToGroupId(msg.getStringProperty(key));
            } else if( key.startsWith(prefixFooterKey) ) {
                if( footerMap==null ) footerMap = new HashMap();
                String name = key.substring(prefixFooterKey.length());
                footerMap.put(name, msg.getObjectProperty(key));
            } else {
                if( apMap==null ) apMap = new HashMap();
                apMap.put(key, msg.getObjectProperty(key));
            }
        }


        MessageAnnotations ma=null;
        if( maMap!=null ) ma = new MessageAnnotations(maMap);
        DeliveryAnnotations da=null;
        if( daMap!=null ) da = new DeliveryAnnotations(daMap);
        ApplicationProperties ap=null;
        if( apMap!=null ) ap = new ApplicationProperties(apMap);
        Footer footer=null;
        if( footerMap!=null ) footer = new Footer(footerMap);

        ProtonJMessage amqp = MESSAGE_FACTORY.createMessage(header, da, ma, props, ap, body, footer);

        ByteBuffer buffer = ByteBuffer.wrap(new byte[1024*4]);
        final DroppingWritableBuffer overflow = new DroppingWritableBuffer();
        int c = amqp.encode(new CompositeWritableBuffer(new WritableBuffer.ByteBufferWrapper(buffer), overflow));
        if( overflow.position() > 0 ) {
            buffer = ByteBuffer.wrap(new byte[1024*4+overflow.position()]);
            c = amqp.encode(new WritableBuffer.ByteBufferWrapper(buffer));
        }

        return new EncodedMessage(messageFormat, buffer.array(), 0, c);
    }

    private static String destinationAttributes(Destination destination) {
        if( destination instanceof Queue ) {
            if( destination instanceof TemporaryQueue ) {
                return "temporary,queue";
            } else {
                return "queue";
            }
        }
        if( destination instanceof Topic ) {
            if( destination instanceof TemporaryTopic ) {
                return "temporary,topic";
            } else {
                return "topic";
            }
        }
        return "";
    }
}
