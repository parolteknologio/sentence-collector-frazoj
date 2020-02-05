#!/bin/bash
awk 'length>3' startfile.txt > 1-lenthless3.txt
awk 'NF<=14' 1-lenthless3.txt > 2-lenghtless14.txt
sed '/[w|W|q|Q|x|X|y|Y]/d' 2-lenghtless14.txt > 3-no-eo-letter-x.txt
sed '/[ä|Ä|ö|Ö|ü|Ü|ß|ð|ð|À|Á|Â|Ã|Å|Æ|Ç|È|É|Ê|Ë|Ì|Í|İ|Î|Ï|Ð|Ñ|Ò|Ó|Ô|Õ|Ø|Ù|Ú|Û|Û|Ý|Ž|à|á|â|ã|å|æ|ç|è|é|ê|ë|ì|í|î|ï|ð|ñ|ò|ó|ô|õ|ø|ù|ú|û|ý|þ|ÿ|ā|ă|ą|ć|ċ|č|ď|đ|ē|ĕ|ė|ę|ě|ğ|ġ|ģ|ħ|ĩ|ī|ĭ|į|ı|ķ|ĸ|ĺ|ļ|ľ|ŀ|ł|ń|ņ|ņ|ṫ|š|Ў|ḃ|ḋ|ḟ|ṁ|ṗ|ṡ|ẁ|ẃ|ẅ|ẛ|ỳ|α|β|Γ|γ|Δ|δ|ε|ζ|η|Θ|θ|ι|κ|Λ|λ|μ|ν|Ξ|ξ|Π|π|ρ|Σ|σ|ς|τ|ș|ế|ō|ů|ū|Ł|ş|ş|ǐ|ż|ő|ň|ự|ň|ž|ị|Ō|ŏ|Č|Š|ř|ś]/d' 3-no-eo-letter-x.txt > 4-no-non-ascii.txt
sed '/[0-9]/d' 4-no-non-ascii.txt > 5-no-numbers.txt
sed '/[A-Z][A-Z]/d' 5-no-numbers.txt > 6-no-abbrevations.txt
grep -v " .\." 6-no-abbrevations.txt > 7-no-abbrevaitions-single-letter.txt
 awk '/\./ || /\?/ || /\!/' 7-no-abbrevaitions-single-letter.txt > 8-only-valid-sentences.txt