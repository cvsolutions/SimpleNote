{extends file="layout.tpl"}

{block name="panel"}
    <div class="panel panel-default">
        <div class="panel-heading">The simplest way to keep notes</div>
        <div class="panel-body">
            <form class="" action="/process" method="post" role="form">

                {include file="alert.tpl"}

                <div class="form-group">
                    <input type="text" class="form-control" required="" name="fullname" value="" placeholder="Fare clic per impostare il Titolo...">
                </div>

                <div class="form-group">
                    <textarea class="form-control" name="memo" rows="15"></textarea>
                </div>

                <input type="hidden" name="id" value="0">
                <input type="submit" class="btn btn-danger" value="Aggiungi">

            </form>
        </div>
    </div>
{/block}