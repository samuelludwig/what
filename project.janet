(declare-project
  :name "what"
  :description "A quick-note software that tells me what"

  # Optional urls to git repositories that contain required artifacts.
  :dependencies [])

(declare-executable
  :name "what"
  :entry "what.janet")
