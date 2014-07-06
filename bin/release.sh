#!/bin/bash

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

# release.sh - Creates release tarballs from the upstream source
# repository.
#

ME=$(basename ${0})
CURRDIR=$PWD
die()
{
    printf "ERROR: %s\n" "$*"
    exit 1
}

URL="http://svn.apache.org/repos/asf/qpid/proton"
BRANCH="trunk"
VERSION=""
REVISION=""

usage()
{
    echo "Usage: ${ME} -v VERSION [-u URL] [-b BRANCH] [-r REVISION]"
    echo "-u URL      The base URL for the repository (def. ${URL})"
    echo "-b BRANCH   The branch to check out (def. ${BRANCH})"
    echo "-r REVISION The revision to check out (def. HEAD)"
    echo "-d          Show verbose debugging output"
    echo ""
    exit 0
}


while getopts "hu:b:r:v:d" OPTION; do
    case $OPTION in
        h) usage;;

        u) URL=$OPTARG;;

        b) BRANCH=$OPTARG;;

        r) REVISION=$OPTARG;;

        d) set -v;;

        \?) usage;;
    esac
done

if [[ -z "${REVISION}" ]]; then
    # grab a consistent revision to use for all exports
    REVISION=$(svn info http://svn.apache.org/repos/asf/qpid/proton | fgrep Revision: | awk '{ print $2 }')
fi

echo "Using svn revision ${REVISION}."

##
## Create the tarball
##
WORKDIR=$(mktemp -d)
mkdir -p "${WORKDIR}"
(
    cd ${WORKDIR}
    svn export -qr ${REVISION} ${URL}/${BRANCH}/ tmp
    VERSION=$(cat tmp/version.txt)
    rootname="qpid-proton-${VERSION}"
    mv tmp ${rootname}

    cat <<EOF > ${rootname}/SVN_INFO
Repo: ${URL}
Branch: ${BRANCH}
Revision: ${REVISION}
EOF

    mvn org.codehaus.mojo:versions-maven-plugin:1.2:set org.codehaus.mojo:versions-maven-plugin:1.2:commit -DnewVersion="${VERSION}" -f ${WORKDIR}/${rootname}/pom.xml

    ##
    ## Remove content not for release
    ##
    rm -r ${rootname}/design

    echo "Generating Archive: ${CURRDIR}/${rootname}.tar.gz"
    tar zcf ${CURRDIR}/${rootname}.tar.gz ${rootname} \
        --exclude=.gitignore
)
