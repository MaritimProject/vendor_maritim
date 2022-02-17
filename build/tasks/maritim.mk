#
# Copyright (C) 2022 a MARITIM Prjkt
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

MARITIM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(MARITIM_BUILD_VERSION).zip
MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: maritim
maritim: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(MARITIM_TARGET_PACKAGE)
	$(hide) $(MD5) $(MARITIM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(MARITIM_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/maritim/tools/generate_json_build_info.sh $(MARITIM_TARGET_PACKAGE)
	@echo "Done"
	@echo -e "\t ===============================-Package complete-========================================="
	@echo -e "\t Zip: $(MARITIM_TARGET_PACKAGE)"
	@echo -e "\t Size: `du -sh $(MARITIM_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo -e "\t =========================================================================================="
