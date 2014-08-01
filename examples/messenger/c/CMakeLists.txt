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

find_package(Proton REQUIRED)

add_executable(recv recv.c)
add_executable(send send.c)
add_executable(my_recv my_recv.c)
add_executable(my_send my_send.c)
add_executable(my_recv_dpdk my_recv.c)

include_directories(${Proton_INCLUDE_DIRS})

target_link_libraries(recv ${Proton_LIBRARIES})
target_link_libraries(send ${Proton_LIBRARIES})
target_link_libraries(my_recv ${Proton_LIBRARIES})
target_link_libraries(my_send ${Proton_LIBRARIES})
target_link_libraries(my_recv_dpdk ${Proton_LIBRARIES})
