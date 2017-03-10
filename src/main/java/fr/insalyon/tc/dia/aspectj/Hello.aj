package fr.insalyon.tc.dia.aspectj;

aspect Hello {

    long time = -1L;

    before(): call(void Sample.run()) {
        System.out.println(">>> Calling run");
    }

    before(long n): call(long Sample.fib(long)) && args(n) {
        if (n < 0) {
            throw new IllegalArgumentException("fib is undefined for negative numbers");
        }
    }

    pointcut rootFibCall(long n):
            call(long Sample.fib(long)) && args(n) && !withincode(long Sample.fib(long));

    before(long n): rootFibCall(n){
        if(time!=-1){
            System.err.println("Multiple Thread calls are not supported");
        }
        System.out.println(">>> Fibonacci computation started ...");
        time = System.currentTimeMillis();
    }

    after(long n): rootFibCall(n){
        if(time!=-1){
            System.out.println(">>> Fibonacci Time : "+(System.currentTimeMillis()-time)+"ms");
            time = -1L;
        }
    }

}