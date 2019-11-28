$(document).on('turbolinks:load change', function(){
    $('select#query_batch_id').on('change', function(){
        batch_id = $(this).val();

        $.ajax({
            url: '/batches',
            data: { batch_id: batch_id },
            dataType: 'script',
        }).done(function(){
            // nothing to do
        })
    });
})
