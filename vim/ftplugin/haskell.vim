" Use merlin-like keybindings
map <silent><buffer> <LocalLeader>t :GhcModType<return>
map <silent><buffer> <LocalLeader><LocalLeader> :GhcModTypeClear<return>
map <silent><buffer> <LocalLeader>i :GhcModInfo<return>
map <silent><buffer> <LocalLeader>x :GhcModExpand<return>

" Codegen functions
map <silent><buffer> <LocalLeader>w :GhcModTypeInsert<return>
map <silent><buffer> <LocalLeader>s :GhcModSplitFunCase<return>
map <silent><buffer> <LocalLeader>a :GhcModSigCodegen<return>

setlocal omnifunc=necoghc#omnifunc
