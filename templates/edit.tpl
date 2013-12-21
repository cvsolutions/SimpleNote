{extends file="layout.tpl"}

{block name="panel"}
    <div class="panel panel-default">
        <div class="panel-heading">The simplest way to keep notes.</div>
        <div class="panel-body">
            <form class="" action="/process" method="post" role="form">

                {include file="alert.tpl"}

                <div class="form-group">
                    <input type="text" class="form-control" required="" name="fullname" value="{$row.fullname}" placeholder="">
                </div>

                <div class="form-group">
                    <textarea class="form-control" name="memo" rows="15">{$row.memo}</textarea>
                </div>

                <input type="hidden" name="id" value="{$row.id}">
                <input type="submit" class="btn btn-danger" value="Modifica">
                <a href="/delete/{$row.id}" class="pull-right"><img src="/files/trash.gif" alt=""/></a>

            </form>
        </div>
    </div>
{/block}