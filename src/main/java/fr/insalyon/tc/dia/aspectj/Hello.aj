package fr.insalyon.tc.dia.aspectj;

aspect Hello {

    before(): call(void Sample.run()) {
        System.out.println(">>> Calling run");
    }

    before(long n): call(long Sample.fib(long)) && args(n) {
        if (n < 0) {
            throw new IllegalArgumentException("fib is undefined for negative numbers");
        }
    }
}