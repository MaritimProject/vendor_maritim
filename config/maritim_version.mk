
#
# Copyright (C) 2020 The ConquerOS Project
#				2021 a xdroid Prjkt
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

MARITIM_HOST_TIME := $(shell date +"%Y%m%d-%H%M")
MARITIM_BUILD_DATE := $(shell date -u +%Y%m%d)
MARITIM_BUILD_TIME := $(shell date -u +%H%M)
MARITIM_BUILD_DATE_TIME := $(MARITIM_BUILD_TIME)$(MARITIM_BUILD_DATE)

ifndef MARITIM_BUILD_TYPE
   MARITIM_BUILD_TYPE := PRTYPE
endif

MARITIM_VERSION := rev1.0
MARITIM_CODENAME := prototype
MARITIM_REVISION := maritim_$(MARITIM_VERSION).$(MARITIM_CODENAME).$(MARITIM_BUILD_TYPE)

MARITIM_BUILD_VERSION := $(MARITIM_REVISION)-$(MARITIM_BUILD)-$(MARITIM_HOST_TIME)
MARITIM_BUILD_NUMBER := $(MARITIM_VERSION).$(MARITIM_HOST_TIME)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.maritim.version=$(MARITIM_VERSION) \
   ro.maritim.codename=$(MARITIM_CODENAME) \
   ro.maritim.revision=$(MARITIM_REVISION) \
   ro.maritim.build.version=$(MARITIM_BUILD_VERSION) \
   ro.maritim.build.number=$(MARITIM_BUILD_NUMBER) \
   ro.maritim.build.type=$(MARITIM_BUILD_TYPE) \
   ro.build.datetime=$(MARITIM_BUILD_DATE_TIME)
