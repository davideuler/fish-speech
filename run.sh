docker run -d \
  --name fish-speech-api \
  --gpus all \
  --restart unless-stopped \
  -p 0.0.0.0:8080:8080 \
  -v /mnt/nvme/clawspace/s2-pro-deploy/fish-speech/checkpoints:/app/checkpoints \
  -v /mnt/nvme/clawspace/s2-pro-deploy/fish-speech/references:/app/references \
  --entrypoint /app/.venv/bin/python3 \
  fish-speech-server:latest \
  tools/api_server.py --half --compile \
    --listen 0.0.0.0:8080 \
    --llama-checkpoint-path checkpoints/s2-pro \
    --decoder-checkpoint-path checkpoints/s2-pro/codec.pth \
    --decoder-config-name modded_dac_vq
