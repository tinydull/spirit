<!-- 内存信息 -->
<div class='row'>
    <h2>内存以及交换区信息（K）</h2>
    <div class='col-md-6'>
        <table class='table table-condensed table-striped table-bordered'>
            <tr>
                <td>内存总量</td>
                <td>${mem.mtotal}</td>
            </tr>
            <tr>
                <td>当前内存使用量</td>
                <td>${mem.mused}</td>
            </tr>
            <tr>
                <td>当前内存剩余量</td>
                <td>${mem.mfree}</td>
            </tr>
        </table>
    </div>
    <div class='col-md-6'>
        <table class='table table-condensed table-striped table-bordered'>
            <tr>
                <td>交换区总量</td>
                <td>${mem.stotal}</td>
            </tr>
            <tr>
                <td>当前交换区使用量</td>
                <td>${mem.sused}</td>
            </tr>
            <tr>
                <td>当前交换区剩余量</td>
                <td>${mem.sfree}</td>
            </tr>
        </table>
    </div>
    <input type='hidden' id='memoryuserpercent' value='${mem.percent}'>
    <h4>内存使用量：${mem.percent} % </h4>
</div>



