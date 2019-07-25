@extends ('layouts.app') 
@section ('content')
<div class="modal1 fade1" id="educationalModal" role="dialog">
            <div class="modal-dialog modal-lg">
                
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header modal-headercust">
                       
                    <center>
                        <h4 class="modal-title">ALL PUBLICATIONS <span>GEOFFREY HINTON</span>
                        </h4>
                    </center>
                    </div>
                    <div class="modal-body">
                        <div class="tm-top-box">
                            <div class="table-responsive">
                                <table class="table">
                                    
                                    <thead>
                                        <tr>
                                            <th>YEAR</th>
                                            <th>TITLE</th>
                                            <th>PUBLICATION</th>
                                            <th>C0ST</th>
                                            <th>LINK</th>
                                        </tr>
                                    </thead>
                                    <tbody id="publication1">

                                        @if($data)
                                         @foreach($data as $publication)
                                        <tr class="even">
                                            <td>{!! $publication->year !!}</td>
                                            <td>{!! $publication->title !!}</td>
                                            <td>{!! $publication->publication !!}</td>
                                            <td>
                                                <a href="#">
                                                    <img src="{!! URL::to('public/assets/images/cost-icon.png') !!}">
                                                </a>
                                            </td>
                                            <td>
                                                <a href="{!! $publication->links !!}">
                                                <img src="{!! URL::to('public/assets/images/link-icon.png') !!}">
                                               </a> 
                                            </td>
                                        </tr>
                                        @endforeach
                                      @endif
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="tm-pub-footer">
                                <div class="col-md-9">
                                    <a href="#" class="btn message primeryColorBg" style="background-color: #feff2f">NEWEST</a>
                                    <a href="{!! URL('publication-oldest') !!}/{!! $data[0]->pid !!}" class="btn seeAll">OLDEST</a>
                                    <a href="#" class="btn seeAll">MOST CITED</a>
                                    <a href="#" class="btn seeAll">OPENLY AVAILABLE</a>
                                </div>
                                <div class="col-md-3">
                                    <div id="pub-search">
                                        <div class="input-group stylish-input-group">
                        <input type="text" class="form-control"  placeholder="Search" 
                              onkeyup="publicationallSearch({!! $data[0]->pid !!} );" 
                        id="psearch">
                                            <span class="input-group-addon">
                                          <button type="submit">
                                            <span class="glyphicon glyphicon-search">
                                            </span>
                                         </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>

<script type="text/javascript">

  function publicationallSearch($pid)
  {
    var name = $('#psearch').val();
    var pid  = $pid;

            $.ajax({
            type : "GET",
            url : "publication-search-all",
            data:{ pid:pid, name:name },
            success: function(data)
            {
                //alert(data);
             //$('#publication1').html(data);
            
            }
         });
  }

</script>
@endsection