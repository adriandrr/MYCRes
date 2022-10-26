from Bio.Seq import Seq

def codon_to_as(Codon):
    codon = Seq(str(Codon))
    try:
        return codon.translate()
    except:
        return ""