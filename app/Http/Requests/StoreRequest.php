<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'          => 'required|min:10',
            'description'   => 'required',
            'phone'         => 'required',
            'mobile_phone'  => 'required',
            'logo'          => 'image'
        ];
    }

    //Personalizando mensagens de error
    public function messages()
    {
        return [
            'required' => 'Este Campo :attribute é obrigado',
            'min' => 'Campo deve ter no minimo :min Caracteres',
            'image' => 'Arquivo não é uma imagem válida'
        ];
    }
}
