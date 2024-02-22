import sys
import json
import struct
import subprocess
import os

# Helper function to send a message to the extension
def send_message(message):
    sys.stdout.buffer.write(struct.pack('I', len(message)) + message.encode())
    sys.stdout.buffer.flush()

# Receive a message from the extension
def get_message():
    raw_length = sys.stdin.buffer.read(4)
    if len(raw_length) == 0:
        sys.exit(0)
    message_length = struct.unpack('I', raw_length)[0]
    message = sys.stdin.buffer.read(message_length).decode()
    return json.loads(message)

message = get_message()

if message['text'] == 'run_batch':
    os.system("D:\\SpeakGPTForWindows\\launch.bat " + '"' + message['arg1'] + '" ' + message['arg2'])
    send_message(json.dumps({"response": message['arg1']}))
