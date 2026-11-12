# GCC moderno promuove -Wrange-loop-construct a errore con -Werror; il codice sorgente di
# onnxruntime 1.17.1 (ciclo su gsl::not_null) lo attiva. Non e legato al bug pseudo/openat2:
# e solo una differenza di versione del compilatore rispetto a quando NXP ha validato la ricetta.
CXXFLAGS:append = " -Wno-error=range-loop-construct"
