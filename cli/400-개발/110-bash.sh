#!/bin/bash
set -e
current_dir=$(pwd); cd ../../; project_dir=$(pwd); cd $current_dir
source $HOME/.develop_env
source $project_dir/brand-env/env
source ./.target

echo
echo " - $BRAND_NAME $target bash 로 진입 합니다."
echo

echo "  브랜드   : $BRAND_NAME"
echo "  프로젝트 : $project_dir"
echo "  타켓     : $target"
echo

echo -en "\033]0;run $target\a" 

docker-compose -f $project_dir/docker/docker-compose.yml \
  run --name $BRAND_name-$target-dev-run \
  --rm \
  --service-ports \
  withme2020-jekyll-dev \
  bash -c "echo './run.sh 을 실행하세요' ; bash"
