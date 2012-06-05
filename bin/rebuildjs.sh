#!/usr/bin/env bash
cd $(dirname $0)
HERE=$PWD
TOP=$HERE/..
CHOSEN=$TOP/src.mrdeveloper/chosen
AJAXCHOSEN=$TOP/src.mrdeveloper/ajaxchosen
buildchosen() {
    cd ${CHOSEN} && cake build
}

buildajaxchosen() {
    cd ${AJAXCHOSEN} && cake build
}
cpdist() {
    cd $TOP && \
        cp -v \
        src.mrdeveloper/ajaxchosen/lib/* \
        src.mrdeveloper/chosen/chosen/* \
        src/collective/js/chosen/browser/resources/
    sed -re "s/url\('chosen-sprite\.png'\)/url('++resource++collective.js.chosen\/chosen-sprite.png')/g" -i src/collective/js/chosen/browser/resources/*css
}
buildchosen && buildajaxchosen && cpdist
# vim:set et sts=4 ts=4 tw=0:
