#!/bin/bash
# Cấu hình
MINING_DURATION=60  # Thời gian đào (tính bằng giây)
REST_DURATION=30     # Thời gian nghỉ (tính bằng giây)
POOL_URL="stratum+tcp://ap.vipor.net:5040"  # URL của pool mà bạn muốn đào
USER="RMWTqPzqBZCP3LT893jwxwNhEbs6umRGWw.githubyml"  # Địa chỉ ví hoặc tên đăng nhập của bạn
THREADS=2  # Số lượng luồng CPU muốn sử dụng

# Vòng lặp vô hạn
while true
do
    echo "Bắt đầu đào..."
    ./hellminer -c $POOL_URL -u $USER --cpu $THREADS &
    MINER_PID=$!

    sleep $MINING_DURATION

    echo "Ngừng đào..."
    kill $MINER_PID

    echo "Nghỉ ngơi..."
    sleep $REST_DURATION
done
