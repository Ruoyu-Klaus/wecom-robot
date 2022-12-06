#!/bin/bash

WEBHOOK=${1:-$WEBHOOK_URL}

curl "$WEBHOOK" \
   -H 'Content-Type: application/json' \
   -d '{"msgtype":"template_card","template_card":{"card_type":"text_notice","main_title":{"title":"⚠ Pipeline Notification","desc":"Pipeline '$CI_COMMIT_SHORT_SHA' has failed!"},"horizontal_content_list":[{"keyname":"Author","value":"'$CI_COMMIT_AUTHOR'"},{"keyname":"Branch","value":"'$CI_COMMIT_BRANCH'"},{"keyname":"Message","value":"'$CI_COMMIT_MESSAGE'"},{"keyname":"Address","value":"Here","type":1,"url":"'$CI_PIPELINE_URL'"}],"card_action":{"type":1,"url":"'$CI_PIPELINE_URL'"}}}'

