let tagName="python"
let buildCommand="docker build --no-cache -t ". tagName ." ". getcwd()
let runCommand="docker run -i -t ". tagName ." /bin/bash"
let deleteCommand="docker images | grep ". tagName ." | awk '{ print  }' | \\xargs -I '{}' docker rmi {}"

" map commands
map <Leader>rr :call CleanShell(buildCommand)<CR>
map <Leader>rs :call CleanShell(runCommand)<CR>
map <Leader>rd :call CleanShell(deleteCommand)<CR>



