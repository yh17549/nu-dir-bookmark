#!/usr/bin/env nu

let bookmark_file_dir = $"($env.HOME)/.config/bookmark_for_dir"
let bookmark_file = $"($bookmark_file_dir)/bookmark.json"

# add bookmark
def "bm -a" [desc: string] {
  checkAndInitFile
  let work_dir = (pwd)
  open $bookmark_file | append [[desc path];[$desc $work_dir]] | collect | save -f $bookmark_file
  echo 'SUCCESS'
}

def descList [] {
  open $bookmark_file | get desc
}

def checkAndInitFile [] {
  # create dir
  if ($bookmark_file_dir | path exists) == false {
    mkdir $bookmark_file_dir
  }

  if ($bookmark_file | path exists) == false {
    # create file
    touch $bookmark_file
  }
}

# change dir by num
def --env "bm -c" [num: int] {
  cd (open $bookmark_file | get path | get $num)
}

# delete bookmark
def "bm -d" [desc: string@descList] {
  open $bookmark_file | where desc != $desc | collect | save -f $bookmark_file
  open $bookmark_file
}

# manage bookmark, change dir(cd).
def --env bm [
  desc?: string@descList # if input desc, will change dir.
] {
  if ($desc == null) {
    checkAndInitFile
    open $bookmark_file
  } else {
    cd (open $bookmark_file | where desc == $desc | get path | get 0)
  }
}

