{extends file="layout.tpl"}

{block name="panel"}
    <div class="panel panel-default">
        <div class="panel-heading">Visualizza e modifica le note</div>
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
                <input type="submit" class="btn btn-warning" value="Modifica">
                <a href="#" data-toggle="modal" data-target="#deleteModal" class="pull-right"><img src="/files/trash.gif" alt="Elimina nota"/></a>

                <!-- Modal -->
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="">Elimina</h4>
                            </div>
                            <div class="modal-body">
                                <p>Sei sicuro di voler cancellare "{$row.fullname}" ?</p>
                            </div>
                            <div class="modal-footer">
                                <a href="/delete/{$row.id}" class="btn btn-danger">Elimina</a>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
{/block}