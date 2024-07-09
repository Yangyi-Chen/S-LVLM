#!/bin/bash

MODEL_DIR=/projects/bcbf/xingyao6/models
WORK_DIR=`pwd`
IMAGE=/projects/bcbf/xingyao6/apptainer-images/pt-megatron-llm_v1.1.1.sif
echo "MODEL_DIR=$MODEL_DIR"
echo "WORK_DIR=$WORK_DIR"
echo "IMAGE=$IMAGE"

apptainer run --nv \
    --no-home \
    --no-mount bind-paths \
    --cleanenv \
    --env "HUGGING_FACE_HUB_TOKEN=$HUGGING_FACE_HUB_TOKEN" \
    --env "WANDB_API_KEY=$WANDB_API_KEY" \
    --writable-tmpfs \
    --bind /scratch:/scratch \
    --bind $WORK_DIR:/workspace \
    --bind $MODEL_DIR:/models \
    $IMAGE \
    /bin/bash

