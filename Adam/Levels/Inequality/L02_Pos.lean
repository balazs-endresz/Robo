import Adam.Metadata

import Adam.Options.MathlibPart

set_option tactic.hygienic false

open Nat

Game "Adam"
World "Inequality"
Level 2

Title "Kleinergleich"

Introduction
"
**weitere Person**: …ich sag dir, eine positive Zahl kann man sowohl mit `0 < n`
als auch `n ≠ 0` darstellen.

**Robo**: Und da gibts leider keinen Standard dazu.

**weitere Person**: Ja und, da kann man ja einfach mit `Nat.pos_iff_ne_zero`
wechseln. Wart mal, wieso galt das nochmals…
"

Statement Nat.pos_iff_ne_zero (n : ℕ) : 0 < n ↔ n ≠ 0 := by
  Hint "**Robo** (*flüsternd*): Wenn du ein bisschen schwere Maschinerie auffahren willst,
  um in zu beeindrucken, hab ich was. Mach doch eine Fallunterscheidung ob `n` Null ist
  oder nicht!

  **Du** (*flüsternd*): Und wie geht das?

  **Robo** (*laut und selbstsicher*): Wir fangen mit `rcases n` an!"
  rcases n
  Hint "**Du**: Hmm, das muss man doch vereinfachen können.

  **Robo** (*flüsternd*): Zweiter pompöser Auftritt: sag einfach `simp` und lass das alles
  automatisch geschehen."
  simp
  Hint "**Du**: Ah und jetzt falls `n ≠ 0`."
  Branch
    simp only [ne_eq, succ_ne_zero, not_false_iff, iff_true]
    Hint "**Robo**: Warte! Den Rest geb ich dir als Lemma: `Nat.suc_pos`."
    apply Nat.succ_pos
  Branch
    simp?
  constructor
  intro
  simp
  intro
  Hint "**Robo**: Warte! Den Rest geb ich dir als Lemma: `Nat.suc_pos`."
  apply Nat.succ_pos

NewTactic simp
NewLemma Nat.succ_pos
DisabledLemma Nat.pos_iff_ne_zero Nat.succ_pos'
LemmaTab "Nat"

Conclusion "**Du**: Oh `simp` ist ja echt nicht schlecht…

Die andere Person scheint beeindruckt, hat aber gleichzeitig auch das Bedürfnis, dich aus
der Reserve zu locken."
