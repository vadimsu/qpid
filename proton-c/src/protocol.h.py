#!/usr/bin/python
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

from protocol import *

print "/* generated */"
print "#ifndef _PROTON_PROTOCOL_H"
print "#define _PROTON_PROTOCOL_H 1"
print

fields = {}

for type in TYPES:
  fidx = 0
  for f in type.query["field"]:
    print "#define %s_%s (%s)" % (field_kw(type), field_kw(f), fidx)
    fidx += 1

idx = 0

for type in TYPES:
  desc = type["descriptor"]
  name = type["@name"].upper().replace("-", "_")
  print "#define %s_SYM (\"%s\")" % (name, desc["@name"])
  hi, lo = [int(x, 0) for x in desc["@code"].split(":")]
  code = (hi << 32) + lo
  print "#define %s ((uint64_t) %s)" % (name, code)
  fields[code] = (type["@name"], [f["@name"] for f in type.query["field"]])
  idx += 1

print

print """typedef struct {
  const char *name;
  const char *fields[32];
} pn_fields_t;"""

print

print "#ifndef DEFINE_FIELDS"
print "extern"
print "#endif"

print "pn_fields_t FIELDS[256]"
print "#ifdef DEFINE_FIELDS"
print " = {"

for i in range(256):
  if i in fields:
    name, fnames = fields[i]
    if fnames:
      print '  {"%s", {%s}},' % (name, ", ".join(['"%s"' % f for f in fnames]))
    else:
      print '  {"%s", {NULL}},' % name
  else:
    print '  {NULL, {NULL}},'

print "}"
print "#endif"
print ";"

print
print "#endif /* protocol.h */"
