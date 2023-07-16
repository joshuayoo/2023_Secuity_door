import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
import socket
import hashlib
from time import sleep

def connect(i , name):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(('61.74.154.145', 15000))
    send = str(id) + '_' + str(name)
    try:
        message = send.encode()
        sock.send(message)
        data = sock.recv(1024)
        a = data.decode()
        sock.close()
        return a
    except:
        return 'error1'

def read():
    try:
        reader = SimpleMFRC522()
        name = input('New name : ')
        text = hashlib.sha256(str(name).encode()).hexdigest()
        print("Now place your tag to write")
        reader.write(text)
        print(text)
        id, text001 = reader.read()
        print(text001)
        if text001 in text:
            print("Written")
            return id,name
        else:
            return 0, 'error'
    finally:
        GPIO.cleanup

while 1:
    try:
        id, name = read()
        if name == 'error':
            print('error')
        else:
            print(connect(id, name))
    finally:
        GPIO.cleanup