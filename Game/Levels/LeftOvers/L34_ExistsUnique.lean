import Game.Metadata
import Game.Options.MathlibPart

World "Nat2"
Level 5

Title "Exists unique"

Introduction
"
TODO: Es existiert genau eine gerade Primzahl.

"

Statement "" : True := by
  trivial

Conclusion
"
"

NewTactic ring
