# common-voice-files

Notes and files for sentence collection for common voice in Esperanto

## Links
* Common Voice: https://voice.mozilla.org/
* Sentence Collector: https://common-voice.github.io/sentence-collector/#/
* OSCAR or Open Super-large Crawled ALMAnaCH coRpus https://traces1.inria.fr/oscar/
    * the folder less4 contains 20 000 sentences from this corpus with less than four words. I plan to import them in Chunks of 1000.


## useful bash snippets for sentence extraction from old books

### delete all lines with less than three digits
```
awk 'length>3' alico4.txt > alico5..txt
```

### delete all lines containing certain letters
```
 sed '/[w|W|q|Q|x|X|y|Y]/d' marta6.txt > marta7.txt
 
 sed '/[ð|ð|À|Á|Â|Ã|Å|Æ|Ç|È|É|Ê|Ë|Ì|Í|İ|Î|Ï|Ð|Ñ|Ò|Ó|Ô|Õ|Ø|Ù|Ú|Û|Û|Ý|Ž|à|á|â|ã|å|æ|ç|è|é|ê|ë|ì|í|î|ï|ð|ñ|ò|ó|ô|õ|ø|ù|ú|û|ý|þ|ÿ|ā|ă|ą|ć|ċ|č|ď|đ|ē|ĕ|ė|ę|ě|ğ|ġ|ģ|ħ|ĩ|ī|ĭ|į|ı|ķ|ĸ|ĺ|ļ|ľ|ŀ|ł|ń|ņ|ņ|ṫ|š|Ў|ḃ|ḋ|ḟ|ṁ|ṗ|ṡ|ẁ|ẃ|ẅ|ẛ|ỳ|α|β|Γ|γ|Δ|δ|ε|ζ|η|Θ|θ|ι|κ|Λ|λ|μ|ν|Ξ|ξ|Π|π|ρ|Σ|σ|ς|τ|ș|ế|ō|ů|ū|Ł|ş|ş|ǐ|ż|ő|ň|ự|ň|ž|ị|Ō|ŏ|Č|Š|ř|ś]/d' europarl-de-wip.txt > eu2.txt
```

### delete long lines
```
 sed '/^.\{102\}./d' alico3.txt > alico4.txt
```

### Delete all lines with more or eqal 14 words
```
awk 'NF<=14' europarl-de-wip.txt > lees14.txt
```

### Delete all lines beginning with lower case
```
 sed '/^[[:lower:][:punct:]]/d' marta.txt > marta2.txt
```
### Delete all lines containing numbers
```
sed '/[0-9]/d' filename.txt
```

### Delete all lines containing abbreviations
```
sed '/[A-Z][A-Z]/d' europarl-de-wip.txt > eu2.txt
```

### Forgot what this does
```
sed -e 's/^[ \t]*//' alico2.txt > alico3.txt
```

### Delete lines containing slashes
```
sed '\~\/~d'  OSCAR-corpus-eo_dedup.txt > 1.txt
```

### Delete lines with some string
```
grep -v "our" t21.txt > t22.txt
```

### Delete single letters in text
```
grep -v " [fF] "
```
### Delete single letters plus full stops
```
grep -v " .\."
```
### Select only lines containing . ? or !
```
awk '/\./ || /\?/ || /\!/'
```

### Helpfull Regex:

Esperanto Alphabet: 
```
[a-zA-ZĉĈĝĜĥĤĵĴŝŜŭŬ]
```
Single letter in EO-Alphabet:
```
 [a-zA-ZĉĈĝĜĥĤĵĴŝŜŭŬ]{1} 
 All non EO-letters: [^\u0000-\u007BĉĈĝĜĥĤĵĴŝŜŭŬ„“‚‘’”–―—‑…«»]
 [^a-zA-ZĉĈĝĜĥĤĵĴŝŜŭŬ .,?!;-–―“„‚‘…]
 ```
German Alphabet: 
```
[a-zA-ZäöüßÄÖÜ]
All non german letters: [^\u0000-\u007BäöüßÄÖÜ„“‚‘’–]
```
Alphabets:
```
Cyrilic Alphabet: [аАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ]
Arabic alphabet: [\u0600-\u06FF] or [ء-ي]
Extended arabic alphabet: /[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufbc1]|[\ufbd3-\ufd3f]|[\ufd50-\ufd8f]|[\ufd92-\ufdc7]|[\ufe70-\ufefc]|[\uFDF0-\uFDFD]/
Chinese and japanese alphabet: [\u2E80-\u2FD5\u3190-\u319f\u3400-\u4DBF\u4E00-\u9FCC\uF900-\uFAAD]
```
Word endings:
```
\w+(i|as|is|os|us|o|oj|jn|n|u|uj|e|en|em|a|an|aj|ajn|el|al|es|or|om|am|un|ur|ej|ar|in|es|el|er|ep|ok|nt|il|ŭ)\b
[a-zA-ĉĈĝĜĥĤĵĴŝŜŭŬ]+(i|as|is|os|us|o|oj|jn|n|u|uj|e|en|em|a|an|aj|ajn|el|l|es|or|om|am|un|ur|ej|ar|in|es|el|er|ep|ok|nt|il|ĉ|ŭ|t)\b
[a-zA-ĉĈĝĜĥĤĵĴŝŜŭŬ]+[isojuenmalbrmrĉpktĉldtŭ]\b
```

Word patterns:
```
any letter, point, any letter point
.\..\.
One letter word:
 \w{1} 
Question marks in the middle of words:
 \w[?]\w
Point in the middle of words (mainly domains):
\w[.]\w
```


### 100 random sentences
```
sort -R wiki.eo.sort.txt |head -n 100 > wiki.eo.sample.txt
```

### cut file in equal chunks
```
split -l 1000 prefix-
```

### sort alphabetical and delete dublicates
```
sort -u wiki.eo.txt > wiki.eo.sort.txt
```

### count characters
```
sed 's/\(.\)/\1\n/g' wiki.eo.txt | sort | uniq -ic > characters.eo.txt

Alternative:
awk -vFS="" '{for(i=1;i<=NF;i++)w[tolower($i)]++}END{for(i in w) print i,w[i]}' wiki.eo.no-dublicates.non-alphabetical.txt > signs.txt
```
