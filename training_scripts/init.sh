#!/usr/bin/env bash
INCEPTION_V3_URL="http://download.tensorflow.org/models/inception_v3_2016_08_28.tar.gz"
IM2TXT_URL="https://github.com/tensorflow/models/trunk/research/im2txt"

WORK_SPACE="$(pwd)/WORK_SPACE"
UFO1200_DATASET_DIR="${WORK_SPACE}/UFO1200/UFO1200_Dataset"
UFO1200_TEXT_DIR="${WORK_SPACE}/UFO1200/UFO1200_text"
UFO1200_PROCESSED_TEXT_DIR="${WORK_SPACE}/UFO1200/UFO1200_index"

INCEPTION_V3_DIR="${WORK_SPACE}/Inception_V3"

svn export "${IM2TXT_URL}"

mkdir -p "${UFO1200_DATASET_DIR}"
mkdir -p "${UFO1200_TEXT_DIR}"
mkdir -p "${UFO1200_PROCESSED_TEXT_DIR}"
mkdir -p "${INCEPTION_V3_DIR}"

wget "${INCEPTION_V3_URL}" && tar -xzvf inception_v3_2016_08_28.tar.gz -C "${INCEPTION_V3_DIR}" && rm -rf inception_v3_2016_08_28.tar.gz

python2 download_ufo1200_dataset.py

cd im2txt
bazel build -c opt //im2txt/...
