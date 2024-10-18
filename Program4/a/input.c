int main() {
    int x = 10, y = 20, z;
    if (x < y) {
        z = x + y;
    } else {
        z = x - y;
    }

    while (z > 0) {
        z--;
    }

    int a = 5, b = 3;
    int result = a & b;
    result = a | b;
    result = a << 1;
    result = a >> 1;
    result = ~a;
    result = a ^ b;

    if (a && b) {
        result = a || b;
    }
    
    if (a >= b) {
        result = a == b;
        result = a != b;
    }

    return 0;
}

