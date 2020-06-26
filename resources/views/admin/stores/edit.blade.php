@extends('layouts.app');

@section('content')
    <h1>Editar Loja</h1>

    <form action="{{route('admin.stores.update', ['store' => $store->id])}}" method="post" enctype="multipart/form-data">
    <!--<input type="hidden" name="_token" value="{{csrf_token()}}">-->
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="">Nome Loja</label>
            <input type="text" name="name" id="" class="form-control" value="{{$store->name}}">
        </div>

        <div class="form-group">
            <label for="">Descrição</label>
            <input type="text" name="description" id="" class="form-control" value="{{$store->name}}">
        </div>
        <div class="form-group">
            <label for="">Telefone</label>
            <input type="text" name="phone" id="" class="form-control" value="{{$store->phone}}">
        </div>

        <div class="form-group">
            <label for="">Celular/Whatsapp</label>
            <input type="text" name="mobile_phone" id="" class="form-control" value="{{$store->mobile_phone}}">
        </div>

        <div class="form-group">
            <p>
                <img src="{{asset('storage/'. $store->logo)}}" alt="">
            </p>
            <label>Fotos do Produto</label> 
            <input type="file" name="logo" class="form-control  @error('logo') is-invalid @enderror">    
            @error('logo') 
                <div class="invalid-feedback">
                    {{$message}}
                </div>
            @enderror
        </div>

       
        <div class="form-group">
            <button type="submit" class="btn btn-lg btn-success">Atualizar Loja</button>
        </div>
        
    </form>
@endsection