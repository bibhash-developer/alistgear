@include('header')

<?php 
/*echo "<pre>"; 
print_r($publication[1][0]); 
exit;*/
?>
<div class="modal1" id="educationalModal" role="dialog">
              <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header modal-headercust">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">ALL PUBLICATIONS <span>{!! $publication[0][0]->name; !!}</span></h4>
                  </div>
                  <div class="modal-body">
                    <div class="tm-top-box">
                      <div class="tm-top-box-pub">
                        <table class="table">

                          <thead>
                            <tr>
                              <th>YEAR</th>
                              <th>TITLE</th>
                              <th>PUBLICATION</th>
                              <th>CITED by</th>
                              <th>C0ST</th>
                              <th>LINK</th>
                            </tr>
                          </thead>
                          <tbody>
                          @if(isset($publication[1]))
                            @foreach($publication[1] as $publications)
                             <tr class="even">
                               <td>{{ $publications->year}}</td>
                               <td>{{ $publications->title}}</td>
                                <td>{{ $publications->title}}</td>
                                <td>{{ $publications->cited_by}}</td>
                                <td><a href="#"><img src="{!! URL::to('/public/assets/images/cost-icon.png') !!}"></a></td>
                                <td><a href="{{ $publications->links}}"><img src="{!! URL::to('/public/assets/images/link-icon.png') !!}"></a></td>
                              </tr>
                            @endforeach
                           @endif
                            </tbody>
                            <div class="table-responsive" id="second-pub"></div>
                          </table>
                        </div>

                        <div class="tm-pub-footer">
                          <div class="col-md-9">
                            <a href="#" class="btn message primeryColorBg">NEWEST</a>
                            <a href="#" class="btn seeAll">OLDEST</a>
                            <a href="#" class="btn seeAll">MOST CITED</a>
                            <a href="#" class="btn seeAll">OPENLY AVAILABLE</a>
                          </div>
                          <div class="col-md-3">
                            <div id="pub-search">
                      
                                 <div class="input-group stylish-input-group">
                           
                            {!! Form::text('search_title', '',['class' =>'form-control', 'id'=>'txtSearchs', 'placeholder'=>'Search', 
                               'autocomplete' =>'off']) !!} 

                            {!! Form::hidden('search_title', $publication[0][0]->pid, ['class' =>'form-control', 'id'=>'txtSearchs1',]) !!}

                              <span class="input-group-addon">
                                <button type="submit" id="txtSearchsBTns">
                                  <span class="glyphicon glyphicon-search"></span>
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
@include('footer')

