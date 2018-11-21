#!/bin/bash

## change to directory of the script
#cd "$(dirname "$0")"

export baseOpenDoc="fragment/my_impress_open_document.fodp"
export baseSettings="fragment/my_impress_settings.fodp"
export baseStyles="fragment/my_impress_styles.fodp"
export baseOpenBody="fragment/my_impress_open_body.fodp"
export baseCloseBody="fragment/my_impress_close_body.fodp"
export baseCloseDoc="fragment/my_impress_close_document.fodp"

export basePage1x2="fragment/my_impress_page_1x2.fodp"

export baseOfficeTools=${PWD}
echo "exported env var"
