@extends('layouts.app')

@section('content')
@if (!$store)
    <a href="{{route('admin.stores.create')}}" class="btn btn-lg btn-success m-4">Criar Loja</a>
@else
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Loja</th>
                <th>Total de Produtos</th>
                <th>Ações</th>          
            </tr>
        </thead>
        <tbody>           
                <tr>
                    <td>{{$store->id}}</td>
                    <td>{{$store->name}}</td> 
                    <td>{{$store->products->count()}}</td>                   
                    <td>                        
                        <div class="btn-group">
                            <a href="{{route('admin.stores.edit', ['store' => $store->id])}}" class="btn btn-sm btn-primary">Editar</a>
                            <form action="{{route('admin.stores.destroy', ['store' => $store->id])}}" method="post">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-danger">REMOVER</button>
                            </form>
                        </div>
                    </td>                           
                </tr>
           
        </tbody>
    </table>
@endif

    <!--//$stores->links()-->
@endsection