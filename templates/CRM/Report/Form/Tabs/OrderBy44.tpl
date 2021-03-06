<div id="report-tab-order-by-elements" class="civireport-criteria">
  <h3>Order by Columns</h3>

  <table id="optionField">
    <tr>
      <th>&nbsp;</th>
      <th> {ts}Column{/ts}</th>
      <th> {ts}Order{/ts}</th>
      <th> {ts}Section Header / Group By{/ts}</th>
      <th> {ts}Page Break{/ts}</th>
    </tr>

    {section name=rowLoop start=1 loop=6}
      {assign var=index value=$smarty.section.rowLoop.index}
      <tr id="optionField_{$index}" class="form-item {cycle values="odd-row,even-row"}">
        <td>
          {if $index GT 1}
            <a onclick="hideRow({$index}); return false;" name="orderBy_{$index}" href="#" class="form-link"><img src="{$config->resourceBase}i/TreeMinus.gif" class="action-icon" alt="{ts}hide field or section{/ts}"/></a>
          {/if}
        </td>
        <td> {$form.order_bys.$index.column.html}</td>
        <td> {$form.order_bys.$index.order.html}</td>
        <td> {$form.order_bys.$index.section.html}</td>
        <td> {$form.order_bys.$index.pageBreak.html}</td>
      </tr>
    {/section}
  </table>
  <div id="optionFieldLink" class="add-remove-link">
    <a onclick="showHideRow(); return false;" name="optionFieldLink" href="#" class="form-link"><img src="{$config->resourceBase}i/TreePlus.gif" class="action-icon" alt="{ts}show field or section{/ts}"/>{ts}another column{/ts}</a>
  </div>
  <script type="text/javascript">
    var showRows   = new Array({$showBlocks});
    var hideBlocks = new Array({$hideBlocks});
    var rowcounter = 0;
    {literal}
    if (navigator.appName == "Microsoft Internet Explorer") {
      for ( var count = 0; count < hideBlocks.length; count++ ) {
        var r = document.getElementById(hideBlocks[count]);
        r.style.display = 'none';
      }
    }

    // hide and display the appropriate blocks as directed by the php code
    on_load_init_blocks( showRows, hideBlocks, '' );

    function hideRow(i) {
      showHideRow(i);
      // clear values on hidden field, so they're not saved
      cj('select#order_by_column_'+ i).val('');
      cj('select#order_by_order_'+ i).val('ASC');
      cj('input#order_by_section_'+ i).attr('checked', false);
    }

    {/literal}
  </script>
</div>
