rn SSUmCf

## go through all ambiguities 
## D_str: The ambiguity
## D_list: bases coresponding to the ambiguity
def transform_degenerate(SSUmCf_degenerate,D_str,D_list):
    a = edit_ambiguity(SSUmCf_degenerate,D_str,D_list)

    while True:
        t =  a
        a = edit_ambiguity(a,D_str,D_list)
        if len(a) == len(t):
            break
    return a


Y_cor = transform_degenerate(SSUmCf_degenerate,"Y",["C","T"])

SSUmCf_YN_cor = transform_degenerate(Y_cor,"N",["A","G","C","T"])
