# nushell-bookmark

---

This is bookmark management tool for nushell. You can use this tool to manage bookmarks and change the director.

---

## install

- find `env.nu`

  ```sh
  echo $nu.env-path
  ```

- edit `env.nu`

  ```sh
  # append
  source /path/bookmark_for_dir.nu
  ```

---

## usage

### add

> add the current path as a bookmark

```sh
# bm -a BOOKMARK_DESC
# eg: 
~\.config\test1> bm -a first_bookmark
SUCCESS
```

### list

> list all bookmark

```sh
~\.config\test2> bm
╭───┬─────────────────┬──────────────────────────────────────╮
│ # │      desc       │                 path                 │
├───┼─────────────────┼──────────────────────────────────────┤
│ 0 │ first_bookmark  │ C:\Users\Administrator\.config\test1 │
│ 1 │ second_bookmark │ C:\Users\Administrator\.config\test2 │
╰───┴─────────────────┴──────────────────────────────────────╯
```

### change dir

press `Tab` after `bm ` will display completion (desc)

> [!NOTE]
>
> There is space after `bm`

- change dir by desc

  ```sh
  ~\.config> bm 
  first_bookmark      second_bookmark

  ~\.config> bm second_bookmark
  ~\.config\test2>
  ```

- change dir by num

  ```sh
  ~\.config> bm -c 1
  ~\.config\test2>
  ```

### delete bookmark by desc

```sh
~\.config\test2> bm -d first_bookmark
╭───┬─────────────────┬──────────────────────────────────────╮
│ # │      desc       │                 path                 │
├───┼─────────────────┼──────────────────────────────────────┤
│ 0 │ second_bookmark │ C:\Users\Administrator\.config\test2 │
╰───┴─────────────────┴──────────────────────────────────────╯
```

