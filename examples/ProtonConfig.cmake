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

set (Proton_VERSION       ${PN_VERSION})
set (Proton_INCLUDE_DIRS  ${CMAKE_SOURCE_DIR}/proton-c/include)
set (Proton_LIBRARIES     qpid-proton 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_timer.a 
                          ${CMAKE_SOURCE_DIR}/proton-c/libnetinet 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_cmdline.a 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_eal.a 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_hash.a 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_kni.a 
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_kvargs.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_lpm.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_malloc.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_mbuf.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_mempool.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_meter.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_pmd_e1000.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_pmd_ixgbe.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_pmd_ring.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_pmd_virtio_uio.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_pmd_vmxnet3_uio.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_power.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_ring.a
                          ${CMAKE_SOURCE_DIR}/proton-c/librte_sched.a)
set (Proton_FOUND True)
