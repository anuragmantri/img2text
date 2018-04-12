#!/bin/bash
WORK_SPACE="$(pwd)/WORK_SPACE"
UFO1200_DATASET_DIR="${WORK_SPACE}/UFO1200/UFO1200_Dataset"
UFO1200_TEXT_DIR="${WORK_SPACE}/UFO1200/UFO1200_text/UFO1200.token.txt"
UFO1200_PROCESSED_TEXT_DIR="${WORK_SPACE}/UFO1200/UFO1200_index"
UFO1200_PROCESSED_TEXT_NAME="index.json"
TF_RECORDS_OUTPUT_DIR="${WORK_SPACE}/TFRecords"

python2 build_ufo1200_data.py \
  --UFO1200_text_dir="${UFO1200_TEXT_DIR}" \
  --train_image_dir="${UFO1200_DATASET_DIR}" \
  --train_captions_file_dir="${UFO1200_PROCESSED_TEXT_DIR}" \
  --train_captions_file="${UFO1200_PROCESSED_TEXT_NAME}" \
  --output_dir="${TF_RECORDS_OUTPUT_DIR}" \
  --word_counts_output_file="${TF_RECORDS_OUTPUT_DIR}/word_counts.txt" \
  --train_shards=256 \
  --val_shards=4 \
  --test_shards=8
