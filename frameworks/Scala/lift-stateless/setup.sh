#!/bin/bash

sed -i 's|> ".*:3306|> "'"${DBHOST}"':3306|g' src/main/scala/Main.scala

${SBT_HOME}/bin/sbt update assembly

./run &