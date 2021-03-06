#!/bin/bash

# Copyright 2019 Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FAILED=0

echo -ne "sass-lint "
npx sass-lint --version
echo -ne "tslint "
npx tslint  --version

npx sass-lint -c sass-lint.yml --verbose 'dashboard/sass/**/*.scss'
npx tslint dashboard/ts/*.ts

if [[ ${FAILED} -eq 1 ]]
then
    echo "LINTING FAILED"
    exit 1
fi
