SSUmCf_degenerate = ["TATYGYTCTTNAACGAGGAATC"]

## just transform first ambiguity 
## D_str: The ambiguity
## D_list: bases coresponding to the ambiguity
def edit_ambiguity(SSUmCf_degenerate,D_str,D_list):
    SSUmCf = []
    for each in SSUmCf_degenerate:
        i = 0
        
        
        while i < len(each):
            if each[i] == D_str: ##"Y"
            
                for a in D_list: ##["C","T"]
                    SSUmCf.append(each[:i] + a + each[i+1:])
                    
                break ## after dealing with the first ambiguity (each[i] == D_str), break the loop (while i < len(each)).
                      ## if put break at a higher level, the loop break at the first base due to each[i] != D_str.
                      ## and "i" will not move even if each[i] != D_str
        
            i += 1
            
    if len(SSUmCf) != 0:
        SSUmCf = SSUmCf 
    else:
        SSUmCf = SSUmCf_degenerate ## avoild to return a empty list []. if no ambiguities detected, return the original list
    return SSUmCf

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

SSUmCf_degenerate = ["TATYGYTCTTNAACGAGGAATC"]
Y_cor = transform_degenerate(SSUmCf_degenerate,"Y",["C","T"])
SSUmCf_YN_cor = transform_degenerate(Y_cor,"N",["A","G","C","T"])
print "SSUmCf_degenerate:"

## write SSUmCf_forword_degenerate_primers to a fasta file
i = 0
SSUmCf_forword = open("SSUmCf_forword_degenerate_primers.fasta", "w")
while i < len(SSUmCf_YN_cor):
    SSUmCf_forword.write(">SSUmCf_forword_"+str(i)+"\n" + SSUmCf_YN_cor[i]+"\n")
    i +=1

print ",".join(SSUmCf_YN_cor)

LSUmCf_degenerate = ["AACACTCGCAYAYATGYTAGA"]
LSUmCf_Y_cor = transform_degenerate(LSUmCf_degenerate,"Y",["C","T"])
print "LSUmCf_degenerate:"

## write LSUmCf_forword_degenerate_primers to a fasta file
i = 0
LSUmCf_forword = open("LSUmCf_forword_degenerate_primers.fasta", "w")
while i < len(LSUmCf_Y_cor):
    LSUmCf_forword.write(">LSUmCf_forword_"+str(i)+"\n" + LSUmCf_Y_cor[i]+"\n")
    i +=1

print ",".join(LSUmCf_Y_cor)
