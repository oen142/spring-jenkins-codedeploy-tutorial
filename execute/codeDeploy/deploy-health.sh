#!/bin/bash

echo "> Health check 시작"
echo "> curl -s http://localhost:8080/api/v1"

for ERTRY_COUNT in {1..15}
do
  RESPONSE=$(curl -s http://localhost:8080/api/v1)
  UP_COUNT=$(echo $RESPONSE | grep 'UP' | wc -l)

  if [ $UP_COUNT -ge 1 ]
  then # $upcount >= 1 ("UP" 문자열이 있는지 검증)
    echo "> Health Check 성공"
    break
  else
    echo "> Health Check의 응답을 알 수 없거나 혹은 status가 up이 아닙니다."
    echo "> Health Check : ${RESPONSE}"
  fi

  if [ $RETRY_COUNT -eq 10 ]
  then
    echo "> Health Check 실패."
    exit 1
  fi

  echo "> Health Check 연결 실패. 재시도 ..."
  sleep 10
done
exit0