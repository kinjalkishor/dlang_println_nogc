module nogc_print;

import core.stdc.stdio;

/*
@nogc
void main() {
    println("Hello World");
    int a = 10;
    println("value = ", a);
}
*/

// Template function to print any type using printf from C
@nogc void println(T...)(T args) {
	foreach (elem; args) {
		internal_print(elem);
	}
    internal_print("\n");
}

struct ostrz {
    char[256] data;
};

@nogc private void internal_print(ostrz st) {
    printf("%s", st.data.ptr);
}

@nogc private void internal_print(string st) {
    printf("%s", st.ptr);
}

@nogc private void internal_print(int i) {
    printf("%i", i);
}

@nogc private void internal_print(float f) {
    printf("%f", f);
}

@nogc private void internal_print(bool b) {
	if (b) {
		printf("true");
    } else {
		printf("false");
    }
}
