for %%G in (*.sql) do sqlcmd /S .\SQLEXPRESS /d Genesis -E -i"%%G"
pause