function fibonacci(target) {
    if (target === 1) return 0
    else if (target === 2) return 1
    else return fibonacci(target-1) + fibonacci(target-2)
}

// console.log(fibonacci(13)) // 144



