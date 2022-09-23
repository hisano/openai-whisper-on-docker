FROM python:3.9.14-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Whisper
RUN pip install git+https://github.com/openai/whisper.git

# Install model files
RUN whisper --model tiny dummy.wav; exit 0
RUN whisper --model base dummy.wav; exit 0
RUN whisper --model small dummy.wav; exit 0
RUN whisper --model medium dummy.wav; exit 0
RUN whisper --model large dummy.wav; exit 0
RUN whisper --model tiny.en dummy.wav; exit 0
RUN whisper --model base.en dummy.wav; exit 0
RUN whisper --model small.en dummy.wav; exit 0
RUN whisper --model medium.en dummy.wav; exit 0

ENTRYPOINT ["whisper"]
CMD ["--help"]
