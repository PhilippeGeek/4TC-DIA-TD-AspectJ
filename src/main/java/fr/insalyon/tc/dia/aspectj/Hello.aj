package fr.insalyon.tc.dia.aspectj;

aspect Hello {

    before(): call(void Sample.run()) {
        System.out.println(">>> Calling run");
    }
}