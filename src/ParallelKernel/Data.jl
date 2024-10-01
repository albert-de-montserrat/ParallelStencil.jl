const DATA_DOC = """
    Module Data

The module Data is created in the module where `@init_parallel_kernel` is called from. It provides the following types:

--------------------------------------------------------------------------------
    Data.Number

The type of numbers used by @zeros, @ones, @rand and @fill and in all array types of module `Data` (selected with argument `numbertype` of [`@init_parallel_kernel`](@ref)).

--------------------------------------------------------------------------------
    Data.Index

The type of indices used in parallel kernels.

--------------------------------------------------------------------------------
    Data.Array{ndims}

Expands to `Data.Array{numbertype, ndims}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref) and the datatype `Data.Array` is chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (Array for Threads or Polyester, CUDA.CuArray or CUDA.CuDeviceArray for CUDA and AMDGPU.ROCArray or AMDGPU.ROCDeviceArray for AMDGPU; [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required).

--------------------------------------------------------------------------------
    Data.CellArray{ndims}

Expands to `Data.CellArray{numbertype, ndims}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref) and the datatype `Data.CellArray` is chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (CPUCellArray for Threads or Polyester, CuCellArray or CuDeviceCellArray for CUDA and ROCCellArray or ROCDeviceCellArray for AMDGPU; [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CellArray automatically to DeviceCellArray when required).

--------------------------------------------------------------------------------
    Data.Cell{S}

Expands to `Union{StaticArrays.SArray{S, numbertype}, StaticArrays.FieldArray{S, numbertype}}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref).

--------------------------------------------------------------------------------
    Data.NumberTuple{N_tuple} | Data.NamedNumberTuple{N_tuple, names} | Data.NumberCollection{N_tuple}

Expands to: `NTuple{N_tuple, Data.Number}` | `NamedTuple{names, NTuple{N_tuple, Data.Number}}` | `Union{Data.NumberTuple{N_tuple}, Data.NamedNumberTuple{N_tuple}}`

--------------------------------------------------------------------------------
    Data.IndexTuple{N_tuple} | Data.NamedIndexTuple{N_tuple, names} | Data.IndexCollection{N_tuple}

Expands to: `NTuple{N_tuple, Data.Index}` | `NamedTuple{names, NTuple{N_tuple, Data.Index}}` | `Union{Data.IndexTuple{N_tuple}, Data.NamedIndexTuple{N_tuple}}`

--------------------------------------------------------------------------------
    Data.ArrayTuple{N_tuple, N} | Data.NamedArrayTuple{N_tuple, N, names} | Data.ArrayCollection{N_tuple, N}

Expands to: `NTuple{N_tuple, Data.Array{N}}` | `NamedTuple{names, NTuple{N_tuple, Data.Array{N}}}` | `Union{Data.ArrayTuple{N_tuple, N}, Data.NamedArrayTuple{N_tuple, N}}`

--------------------------------------------------------------------------------
    Data.CellArrayTuple{N_tuple, N, B} | Data.NamedCellArrayTuple{N_tuple, N, B, names} | Data.CellArrayCollection{N_tuple, N, B}

Expands to: `NTuple{N_tuple, Data.CellArray{N, B}}` | `NamedTuple{names, NTuple{N_tuple, Data.CellArray{N, B}}}` | `Union{Data.CellArrayTuple{N_tuple, N, B}, Data.NamedCellArrayTuple{N_tuple, N, B}}`

--------------------------------------------------------------------------------
    Data.CellTuple{N_tuple, S} | Data.NamedCellTuple{N_tuple, S, names} | Data.CellCollection{N_tuple, S}

Expands to: `NTuple{N_tuple, Data.Cell{S}}` | `NamedTuple{names, NTuple{N_tuple, Data.Cell{S}}}` | `Union{Data.CellTuple{N_tuple, S}, Data.NamedCellTuple{N_tuple, S}}`

--------------------------------------------------------------------------------
!!! note "Advanced"
        Data.DeviceArray{ndims}

    Expands to `Data.DeviceArray{numbertype, ndims}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref) and the datatype `Data.DeviceArray` is chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (Array for Threads or Polyester, CUDA.CuDeviceArray for CUDA AMDGPU.ROCDeviceArray for AMDGPU).

    !!! warning
        This datatype is not intended for explicit manual usage. [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required.

    --------------------------------------------------------------------------------
        Data.DeviceCellArray{ndims}

    Expands to `Data.DeviceCellArray{numbertype, ndims}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref) and the datatype `Data.DeviceCellArray` is chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (CPUCellArray for Threads or Polyester, CuDeviceCellArray for CUDA and ROCDeviceCellArray for AMDGPU).

    !!! warning
        This datatype is not intended for explicit manual usage. [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required.
"""

const DATA_DOC_NUMBERTYPE_NONE = """
    Module Data

The module Data is created in the module where `@init_parallel_kernel` is called from. It provides the following types:

--------------------------------------------------------------------------------
    Data.Index

The type of indices used in parallel kernels.

--------------------------------------------------------------------------------
    Data.Array{numbertype, ndims}

The datatype `Data.Array` is automatically chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (Array for Threads or Polyester, CUDA.CuArray or CUDA.CuDeviceArray for CUDA and AMDGPU.ROCArray or AMDGPU.ROCDeviceArray for AMDGPU; [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required).

--------------------------------------------------------------------------------
    Data.CellArray{numbertype, ndims}

The datatype `Data.CellArray` is automatically chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (CPUCellArray for Threads or Polyester, CuCellArray or CuDeviceCellArray for CUDA and ROCCellArray or ROCDeviceCellArray for AMDGPU; [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CellArray automatically to DeviceCellArray in kernels when required).

--------------------------------------------------------------------------------
    Data.Cell{numbertype, S}

Expands to `Union{StaticArrays.SArray{S, numbertype}, StaticArrays.FieldArray{S, numbertype}}`, where `numbertype` is the datatype selected with [`@init_parallel_kernel`](@ref).

--------------------------------------------------------------------------------
    Data.NumberTuple{N_tuple, numbertype} | Data.NamedNumberTuple{N_tuple, numbertype, names} | Data.NumberCollection{N_tuple, numbertype}

Expands to: `NTuple{N_tuple, numbertype}` | `NamedTuple{names, NTuple{N_tuple, numbertype}}` | `Union{Data.NumberTuple{N_tuple, numbertype}, Data.NamedNumberTuple{N_tuple, numbertype}}`

--------------------------------------------------------------------------------
    Data.IndexTuple{N_tuple} | Data.NamedIndexTuple{N_tuple, names} | Data.IndexCollection{N_tuple}

Expands to: `NTuple{N_tuple, Data.Index}` | `NamedTuple{names, NTuple{N_tuple, Data.Index}}` | `Union{Data.IndexTuple{N_tuple}, Data.NamedIndexTuple{N_tuple}}`

--------------------------------------------------------------------------------
    Data.ArrayTuple{N_tuple, numbertype, N} | Data.NamedArrayTuple{N_tuple, numbertype, N, names} | Data.ArrayCollection{N_tuple, numbertype, N}

Expands to: `NTuple{N_tuple, Data.Array{numbertype, N}}` | `NamedTuple{names, NTuple{N_tuple, Data.Array{numbertype, N}}}` | `Union{Data.ArrayTuple{N_tuple, numbertype, N}, Data.NamedArrayTuple{N_tuple, numbertype, N}}`

--------------------------------------------------------------------------------
    Data.CellArrayTuple{N_tuple, numbertype, N, B} | Data.NamedCellArrayTuple{N_tuple, numbertype, N, B, names} | Data.CellArrayCollection{N_tuple, numbertype, N, B}

Expands to: `NTuple{N_tuple, Data.CellArray{numbertype, N, B}}` | `NamedTuple{names, NTuple{N_tuple, Data.CellArray{numbertype, N, B}}}` | `Union{Data.CellArrayTuple{N_tuple, numbertype, N, B}, Data.NamedCellArrayTuple{N_tuple, numbertype, N, B}}`

--------------------------------------------------------------------------------
    Data.CellTuple{N_tuple, numbertype, S} | Data.NamedCellTuple{N_tuple, numbertype, S, names} | Data.CellCollection{N_tuple, numbertype, S}

Expands to: `NTuple{N_tuple, Data.Cell{numbertype, S}}` | `NamedTuple{names, NTuple{N_tuple, Data.Cell{numbertype, S}}}` | `Union{Data.CellTuple{N_tuple, numbertype, S}, Data.NamedCellTuple{N_tuple, numbertype, S}}`

--------------------------------------------------------------------------------
!!! note "Advanced"
        Data.DeviceArray{numbertype, ndims}

    The datatype `Data.DeviceArray` is automatically chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (Array for Threads or Polyester, CUDA.CuDeviceArray for CUDA and AMDGPU.ROCDeviceArray for AMDGPU).

    !!! warning
        This datatype is not intended for explicit manual usage. [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required.

    --------------------------------------------------------------------------------
        Data.DeviceCellArray{numbertype, ndims}

    The datatype `Data.DeviceCellArray` is automatically chosen to be compatible with the package for parallelization selected with [`@init_parallel_kernel`](@ref) (CPUCellArray for Threads or Polyester, CuDeviceCellArray for CUDA and ROCDeviceCellArray for AMDGPU).
        
    !!! warning
        This datatype is not intended for explicit manual usage. [`@parallel`](@ref) and [`@parallel_indices`](@ref) convert CUDA.CuArray and AMDGPU.ROCArray automatically to CUDA.CuDeviceArray and AMDGPU.ROCDeviceArray in kernels when required.
"""


# EMPTY MODULE

function Data_none()
    :(baremodule Data # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
    end)
end


# CUDA

function Data_cuda(modulename::Symbol, numbertype::DataType, indextype::DataType)
    Data_module = if (numbertype == NUMBERTYPE_NONE)
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, CUDA, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_CuCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const CuCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,CUDA.CuArray{T_elem,CellArrays._N}}
            # CellArrays.@define_CuCellArray
            # export CuCellArray
            const Index                         = $indextype
            const Array{T, N}                   = CUDA.CuArray{T, N}
            const DeviceArray{T, N}             = CUDA.CuDeviceArray{T, N}
            const Cell{T, S}                    = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}              = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}       = CuCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B} = CellArrays.CellArray{<:DeviceCell{T_elem},N,B,<:CUDA.CuDeviceArray{T_elem,CellArrays._N}}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, CUDA, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_CuCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const CuCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,CUDA.CuArray{T_elem,CellArrays._N}}
            # CellArrays.@define_CuCellArray
            # export CuCellArray
            const Index                          = $indextype
            const Number                         = $numbertype
            const Array{N}                       = CUDA.CuArray{$numbertype, N}
            const DeviceArray{N}                 = CUDA.CuDeviceArray{$numbertype, N}
            const Cell{S}                        = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const DeviceCell{S}                  = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const CellArray{N, B}                = CuCellArray{<:Cell,N,B,$numbertype}
            const DeviceCellArray{N, B}          = CellArrays.CellArray{<:DeviceCell,N,B,<:CUDA.CuDeviceArray{$numbertype,CellArrays._N}}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(Data_module))
end

function TData_cuda(modulename::Symbol, numbertype::DataType, indextype::DataType)
    Data_module = if (numbertype == NUMBERTYPE_NONE)
        :()
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, CUDA, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_CuCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const CuCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,CUDA.CuArray{T_elem,CellArrays._N}}
            # CellArrays.@define_CuCellArray
            # export CuCellArray
            const Array{T, N}                   = CUDA.CuArray{T, N}
            const DeviceArray{T, N}             = CUDA.CuDeviceArray{T, N}
            const Cell{T, S}                    = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}              = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}       = CuCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B} = CellArrays.CellArray{<:DeviceCell{T_elem},N,B,<:CUDA.CuDeviceArray{T_elem,CellArrays._N}}
            $(TData_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(Data_module))
end


# AMDGPU

function Data_amdgpu(modulename::Symbol, numbertype::DataType, indextype::DataType)
    Data_module = if (numbertype == NUMBERTYPE_NONE)
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, AMDGPU, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_ROCCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const ROCCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,AMDGPU.ROCArray{T_elem,CellArrays._N}}
            # CellArrays.@define_ROCCellArray
            # export ROCCellArray
            const Index                         = $indextype
            const Array{T, N}                   = AMDGPU.ROCArray{T, N}
            const DeviceArray{T, N}             = AMDGPU.ROCDeviceArray{T, N}
            const Cell{T, S}                    = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}              = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}       = ROCCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B} = CellArrays.CellArray{<:DeviceCell{T_elem},N,B,<:AMDGPU.ROCDeviceArray{T_elem,CellArrays._N}}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, AMDGPU, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_ROCCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const ROCCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,AMDGPU.ROCArray{T_elem,CellArrays._N}}
            # CellArrays.@define_ROCCellArray
            # export ROCCellArray
            const Index                          = $indextype
            const Number                         = $numbertype
            const Array{N}                       = AMDGPU.ROCArray{$numbertype, N}
            const DeviceArray{N}                 = AMDGPU.ROCDeviceArray{$numbertype, N}
            const Cell{S}                        = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const DeviceCell{S}                  = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const CellArray{N, B}                = ROCCellArray{<:Cell,N,B,$numbertype}
            const DeviceCellArray{N, B}          = CellArrays.CellArray{<:DeviceCell,N,B,<:AMDGPU.ROCDeviceArray{$numbertype,CellArrays._N}}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(Data_module))
end

function TData_amdgpu(modulename::Symbol, numbertype::DataType, indextype::DataType)
    Data_module = if (numbertype == NUMBERTYPE_NONE)
        :()
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, AMDGPU, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            # TODO: the constructors defined by CellArrays.@define_ROCCellArray lead to pre-compilation issues due to a bug in Julia. We therefore only create the type alias here for now.
            const ROCCellArray{T,N,B,T_elem} = CellArrays.CellArray{T,N,B,AMDGPU.ROCArray{T_elem,CellArrays._N}}
            # CellArrays.@define_ROCCellArray
            # export ROCCellArray
            const Array{T, N}                   = AMDGPU.ROCArray{T, N}
            const DeviceArray{T, N}             = AMDGPU.ROCDeviceArray{T, N}
            const Cell{T, S}                    = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}              = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}       = ROCCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B} = CellArrays.CellArray{<:DeviceCell{T_elem},N,B,<:AMDGPU.ROCDeviceArray{T_elem,CellArrays._N}}
            $(TData_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(Data_module))
end


# CPU

function Data_cpu(modulename::Symbol, numbertype::DataType, indextype::DataType)
    Data_module = if (numbertype == NUMBERTYPE_NONE)
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            const Index                          = $indextype
            const Array{T, N}                    = Base.Array{T, N}
            const DeviceArray{T, N}              = Base.Array{T, N}
            const Cell{T, S}                     = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}               = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}        = CellArrays.CPUCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B}  = CellArrays.CPUCellArray{<:DeviceCell{T_elem},N,B,T_elem}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            const Index                          = $indextype
            const Number                         = $numbertype
            const Array{N}                       = Base.Array{$numbertype, N}
            const DeviceArray{N}                 = Base.Array{$numbertype, N}
            const Cell{S}                        = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const DeviceCell{S}                  = Union{StaticArrays.SArray{S, $numbertype}, StaticArrays.FieldArray{S, $numbertype}}
            const CellArray{N, B}                = CellArrays.CPUCellArray{<:Cell,N,B,$numbertype}
            const DeviceCellArray{N, B}          = CellArrays.CPUCellArray{<:DeviceCell,N,B,$numbertype}
            $(Data_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(Data_module))
end

function TData_cpu(modulename::Symbol, numbertype::DataType, indextype::DataType)
    TData_module = if (numbertype == NUMBERTYPE_NONE)
        :()
    else
        :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
            import Base, ParallelStencil.ParallelKernel.CellArrays, ParallelStencil.ParallelKernel.StaticArrays
            const Array{T, N}                   = Base.Array{T, N}
            const DeviceArray{T, N}             = Base.Array{T, N}
            const Cell{T, S}                    = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const DeviceCell{T, S}              = Union{StaticArrays.SArray{S, T}, StaticArrays.FieldArray{S, T}}
            const CellArray{T_elem, N, B}       = CellArrays.CPUCellArray{<:Cell{T_elem},N,B,T_elem}
            const DeviceCellArray{T_elem, N, B} = CellArrays.CPUCellArray{<:DeviceCell{T_elem},N,B,T_elem}
            $(TData_xpu_exprs(numbertype, indextype))
        end)
    end
    return prewalk(rmlines, flatten(TData_module))
end


# xPU

function Data_xpu_exprs(numbertype::DataType, indextype::DataType)
    if numbertype == NUMBERTYPE_NONE
        quote
            const IndexTuple{N_tuple}                                      = NTuple{N_tuple, Index}
            const NumberTuple{N_tuple, T}                                  = NTuple{N_tuple, T}
            const ArrayTuple{N_tuple, T, N}                                = NTuple{N_tuple, Array{T, N}}
            const DeviceArrayTuple{N_tuple, T, N}                          = NTuple{N_tuple, DeviceArray{T, N}}
            const CellTuple{N_tuple, T, S}                                 = NTuple{N_tuple, Cell{T, S}}
            const DeviceCellTuple{N_tuple, T, S}                           = NTuple{N_tuple, DeviceCell{T, S}}
            const CellArrayTuple{N_tuple, T_elem, N, B}                    = NTuple{N_tuple, CellArray{T_elem, N, B}}
            const DeviceCellArrayTuple{N_tuple, T_elem, N, B}              = NTuple{N_tuple, DeviceCellArray{T_elem, N, B}}

            const NamedIndexTuple{N_tuple, names}                          = NamedTuple{names, <:IndexTuple{N_tuple}}
            const NamedNumberTuple{N_tuple, T, names}                      = NamedTuple{names, <:NumberTuple{N_tuple, T}}
            const NamedArrayTuple{N_tuple, T, N, names}                    = NamedTuple{names, <:ArrayTuple{N_tuple, T, N}}
            const NamedDeviceArrayTuple{N_tuple, T, N, names}              = NamedTuple{names, <:DeviceArrayTuple{N_tuple, T, N}}
            const NamedCellTuple{N_tuple, T, S, names}                     = NamedTuple{names, <:CellTuple{N_tuple, T, S}}
            const NamedDeviceCellTuple{N_tuple, T, S, names}               = NamedTuple{names, <:DeviceCellTuple{N_tuple, T, S}}
            const NamedCellArrayTuple{N_tuple, T_elem, N, B, names}        = NamedTuple{names, <:CellArrayTuple{N_tuple, T_elem, N, B}}
            const NamedDeviceCellArrayTuple{N_tuple, T_elem, N, B, names}  = NamedTuple{names, <:DeviceCellArrayTuple{N_tuple, T_elem, N, B}}

            const IndexCollection{N_tuple}                                 = Union{IndexTuple{N_tuple}, NamedIndexTuple{N_tuple}}
            const NumberCollection{N_tuple, T}                             = Union{NumberTuple{N_tuple, T}, NamedNumberTuple{N_tuple, T}}
            const ArrayCollection{N_tuple, T, N}                           = Union{ArrayTuple{N_tuple, T, N}, NamedArrayTuple{N_tuple, T, N}}
            const DeviceArrayCollection{N_tuple, T, N}                     = Union{DeviceArrayTuple{N_tuple, T, N}, NamedDeviceArrayTuple{N_tuple, T, N}}
            const CellCollection{N_tuple, T, S}                            = Union{CellTuple{N_tuple, T, S}, NamedCellTuple{N_tuple, T, S}}
            const DeviceCellCollection{N_tuple, T, S}                      = Union{DeviceCellTuple{N_tuple, T, S}, NamedDeviceCellTuple{N_tuple, T, S}}
            const CellArrayCollection{N_tuple, T_elem, N, B}               = Union{CellArrayTuple{N_tuple, T_elem, N, B}, NamedCellArrayTuple{N_tuple, T_elem, N, B}}
            const DeviceCellArrayCollection{N_tuple, T_elem, N, B}         = Union{DeviceCellArrayTuple{N_tuple, T_elem, N, B}, NamedDeviceCellArrayTuple{N_tuple, T_elem, N, B}}

            # TODO: the following constructors lead to pre-compilation issues due to a bug in Julia. They are therefore commented out for now.
            # NamedIndexTuple{}(t::NamedTuple)                         = Base.map(Data.Index, t)
            # NamedNumberTuple{}(T, t::NamedTuple)                     = Base.map(T, t)
            # NamedArrayTuple{}(T, t::NamedTuple)                      = Base.map(Data.Array{T}, t)
            # NamedCellTuple{}(T, t::NamedTuple)                       = Base.map(Data.Cell{T}, t)
            # NamedCellArrayTuple{}(T, t::NamedTuple)                  = Base.map(Data.CellArray{T}, t)

            $(Data_Fields(MODULENAME_FIELDS, numbertype, indextype))
        end
    else
        quote
            const IndexTuple{N_tuple}                                      = NTuple{N_tuple, Index}
            const NumberTuple{N_tuple}                                     = NTuple{N_tuple, Number}
            const ArrayTuple{N_tuple, N}                                   = NTuple{N_tuple, Array{N}}
            const DeviceArrayTuple{N_tuple, N}                             = NTuple{N_tuple, DeviceArray{N}}
            const CellTuple{N_tuple, S}                                    = NTuple{N_tuple, Cell{S}}
            const DeviceCellTuple{N_tuple, S}                              = NTuple{N_tuple, DeviceCell{S}}
            const CellArrayTuple{N_tuple, N, B}                            = NTuple{N_tuple, CellArray{N, B}}
            const DeviceCellArrayTuple{N_tuple, N, B}                      = NTuple{N_tuple, DeviceCellArray{N, B}}

            const NamedIndexTuple{N_tuple, names}                          = NamedTuple{names, <:IndexTuple{N_tuple}}
            const NamedNumberTuple{N_tuple, names}                         = NamedTuple{names, <:NumberTuple{N_tuple}}
            const NamedArrayTuple{N_tuple, N, names}                       = NamedTuple{names, <:ArrayTuple{N_tuple, N}}
            const NamedDeviceArrayTuple{N_tuple, N, names}                 = NamedTuple{names, <:DeviceArrayTuple{N_tuple, N}}
            const NamedCellTuple{N_tuple, S, names}                        = NamedTuple{names, <:CellTuple{N_tuple, S}}
            const NamedDeviceCellTuple{N_tuple, S, names}                  = NamedTuple{names, <:DeviceCellTuple{N_tuple, S}}
            const NamedCellArrayTuple{N_tuple, N, B, names}                = NamedTuple{names, <:CellArrayTuple{N_tuple, N, B}}
            const NamedDeviceCellArrayTuple{N_tuple, N, B, names}          = NamedTuple{names, <:DeviceCellArrayTuple{N_tuple, N, B}}

            const IndexCollection{N_tuple}                                 = Union{IndexTuple{N_tuple}, NamedIndexTuple{N_tuple}}
            const NumberCollection{N_tuple}                                = Union{NumberTuple{N_tuple}, NamedNumberTuple{N_tuple}}
            const ArrayCollection{N_tuple, N}                              = Union{ArrayTuple{N_tuple, N}, NamedArrayTuple{N_tuple, N}}
            const DeviceArrayCollection{N_tuple, N}                        = Union{DeviceArrayTuple{N_tuple, N}, NamedDeviceArrayTuple{N_tuple, N}}
            const CellCollection{N_tuple, S}                               = Union{CellTuple{N_tuple, S}, NamedCellTuple{N_tuple, S}}
            const DeviceCellCollection{N_tuple, S}                         = Union{DeviceCellTuple{N_tuple, S}, NamedDeviceCellTuple{N_tuple, S}}
            const CellArrayCollection{N_tuple, N, B}                       = Union{CellArrayTuple{N_tuple, N, B}, NamedCellArrayTuple{N_tuple, N, B}}
            const DeviceCellArrayCollection{N_tuple, N, B}                 = Union{DeviceCellArrayTuple{N_tuple, N, B}, NamedDeviceCellArrayTuple{N_tuple, N, B}}
            
            # TODO: the following constructors lead to pre-compilation issues due to a bug in Julia. They are therefore commented out for now.
            # NamedIndexTuple{}(t::NamedTuple)                         = Base.map(Data.Index, t)
            # NamedNumberTuple{}(t::NamedTuple)                        = Base.map(Data.Number, t)
            # NamedArrayTuple{}(t::NamedTuple)                         = Base.map(Data.Array, t)
            # NamedCellTuple{}(t::NamedTuple)                          = Base.map(Data.Cell, t)
            # NamedCellArrayTuple{}(t::NamedTuple)                     = Base.map(Data.CellArray, t)

            $(Data_Fields(MODULENAME_FIELDS, numbertype, indextype))
        end
    end
end


function TData_xpu_exprs(numbertype::DataType, indextype::DataType)
    if numbertype == NUMBERTYPE_NONE
        quote end
    else
        quote
            const NumberTuple{N_tuple, T}                                 = NTuple{N_tuple, T}
            const ArrayTuple{N_tuple, T, N}                               = NTuple{N_tuple, Array{T, N}}
            const DeviceArrayTuple{N_tuple, T, N}                         = NTuple{N_tuple, DeviceArray{T, N}}
            const CellTuple{N_tuple, T, S}                                = NTuple{N_tuple, Cell{T, S}}
            const DeviceCellTuple{N_tuple, T, S}                          = NTuple{N_tuple, DeviceCell{T, S}}
            const CellArrayTuple{N_tuple, T_elem, N, B}                   = NTuple{N_tuple, CellArray{T_elem, N, B}}
            const DeviceCellArrayTuple{N_tuple, T_elem, N, B}             = NTuple{N_tuple, DeviceCellArray{T_elem, N, B}}

            const NamedNumberTuple{N_tuple, T, names}                     = NamedTuple{names, <:NumberTuple{N_tuple, T}}
            const NamedArrayTuple{N_tuple, T, N, names}                   = NamedTuple{names, <:ArrayTuple{N_tuple, T, N}}
            const NamedDeviceArrayTuple{N_tuple, T, N, names}             = NamedTuple{names, <:DeviceArrayTuple{N_tuple, T, N}}
            const NamedCellTuple{N_tuple, T, S, names}                    = NamedTuple{names, <:CellTuple{N_tuple, T, S}}
            const NamedDeviceCellTuple{N_tuple, T, S, names}              = NamedTuple{names, <:DeviceCellTuple{N_tuple, T, S}}
            const NamedCellArrayTuple{N_tuple, T_elem, N, B, names}       = NamedTuple{names, <:CellArrayTuple{N_tuple, T_elem, N, B}}
            const NamedDeviceCellArrayTuple{N_tuple, T_elem, N, B, names} = NamedTuple{names, <:DeviceCellArrayTuple{N_tuple, T_elem, N, B}}

            const NumberCollection{N_tuple, T}                            = Union{NumberTuple{N_tuple, T}, NamedNumberTuple{N_tuple, T}}
            const ArrayCollection{N_tuple, T, N}                          = Union{ArrayTuple{N_tuple, T, N}, NamedArrayTuple{N_tuple, T, N}}
            const DeviceArrayCollection{N_tuple, T, N}                    = Union{DeviceArrayTuple{N_tuple, T, N}, NamedDeviceArrayTuple{N_tuple, T, N}}
            const CellCollection{N_tuple, T, S}                           = Union{CellTuple{N_tuple, T, S}, NamedCellTuple{N_tuple, T, S}}
            const DeviceCellCollection{N_tuple, T, S}                     = Union{DeviceCellTuple{N_tuple, T, S}, NamedDeviceCellTuple{N_tuple, T, S}}
            const CellArrayCollection{N_tuple, T_elem, N, B}              = Union{CellArrayTuple{N_tuple, T_elem, N, B}, NamedCellArrayTuple{N_tuple, T_elem, N, B}}
            const DeviceCellArrayCollection{N_tuple, T_elem, N, B}        = Union{DeviceCellArrayTuple{N_tuple, T_elem, N, B}, NamedDeviceCellArrayTuple{N_tuple, T_elem, N, B}}

            # TODO: the following constructors lead to pre-compilation issues due to a bug in Julia. They are therefore commented out for now.
            # NamedNumberTuple{}(T, t::NamedTuple)                    = Base.map(T, t)
            # NamedArrayTuple{}(T, t::NamedTuple)                     = Base.map(Data.Array{T}, t)
            # NamedCellTuple{}(T, t::NamedTuple)                      = Base.map(Data.Cell{T}, t)
            # NamedCellArrayTuple{}(T, t::NamedTuple)                 = Base.map(Data.CellArray{T}, t)

            $(TData_Fields(MODULENAME_FIELDS, numbertype, indextype))
        end
    end
end


## (DATA SUBMODULE FIELDS - xPU)

function Data_Fields(modulename::Symbol, numbertype::DataType, indextype::DataType) # NOTE: custom data types could be implemented for each alias.
    if numbertype == NUMBERTYPE_NONE
        Fields_module = :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
                            import ..Data, Base

                            # export Field, XField, ...
                            
                            $(Data_Fields_exprs())
                            
                            const VectorField{T, N, names}        = Data.NamedArrayTuple{N, T, N, names}
                            const BVectorField{T, N, names}       = Data.NamedArrayTuple{N, T, N, names}
                            const DeviceVectorField{T, N, names}  = Data.NamedDeviceArrayTuple{N, T, N, names}
                            const DeviceBVectorField{T, N, names} = Data.NamedDeviceArrayTuple{N, T, N, names}

                            const TensorField{T, N, names}        = Data.NamedArrayTuple{N, T, N, names}
                            const DeviceTensorField{T, N, names}  = Data.NamedDeviceArrayTuple{N, T, N, names}
                        end)
    else
        Fields_module = :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
                            import ..Data, Base
                            
                            # export Field, XField, ...

                            $(Data_Fields_exprs())

                            const VectorField{N, names}        = Data.NamedArrayTuple{N, N, names}
                            const BVectorField{N, names}       = Data.NamedArrayTuple{N, N, names}
                            const DeviceVectorField{N, names}  = Data.NamedDeviceArrayTuple{N, N, names}
                            const DeviceBVectorField{N, names} = Data.NamedDeviceArrayTuple{N, N, names}

                            const TensorField{N, names}        = Data.NamedArrayTuple{N, N, names}
                            const DeviceTensorField{N, names}  = Data.NamedDeviceArrayTuple{N, N, names}
                        end)
    end
    return prewalk(rmlines, flatten(Fields_module))
end


function TData_Fields(modulename::Symbol, numbertype::DataType, indextype::DataType) # NOTE: custom data types could be implemented for each alias.
    if numbertype == NUMBERTYPE_NONE
        Fields_module = :()
    else
        Fields_module = :(baremodule $modulename # NOTE: there cannot be any newline before 'module Data' or it will create a begin end block and the module creation will fail.
                            import ..TData, Base

                            # export Field, XField, ...

                            const Field                = TData.Array
                            const XField               = TData.Array
                            const YField               = TData.Array
                            const ZField               = TData.Array
                            const BXField              = TData.Array
                            const BYField              = TData.Array
                            const BZField              = TData.Array
                            const XXField              = TData.Array
                            const YYField              = TData.Array
                            const ZZField              = TData.Array
                            const XYField              = TData.Array
                            const XZField              = TData.Array
                            const YZField              = TData.Array
                            const DeviceField          = TData.DeviceArray
                            const DeviceXField         = TData.DeviceArray
                            const DeviceYField         = TData.DeviceArray
                            const DeviceZField         = TData.DeviceArray
                            const DeviceBXField        = TData.DeviceArray
                            const DeviceBYField        = TData.DeviceArray
                            const DeviceBZField        = TData.DeviceArray
                            const DeviceXXField        = TData.DeviceArray
                            const DeviceYYField        = TData.DeviceArray
                            const DeviceZZField        = TData.DeviceArray
                            const DeviceXYField        = TData.DeviceArray
                            const DeviceXZField        = TData.DeviceArray
                            const DeviceYZField        = TData.DeviceArray

                            const VectorField{T, N, names}        = TData.NamedArrayTuple{N, T, N, names}
                            const BVectorField{T, N, names}       = TData.NamedArrayTuple{N, T, N, names}
                            const DeviceVectorField{T, N, names}  = TData.NamedDeviceArrayTuple{N, T, N, names}
                            const DeviceBVectorField{T, N, names} = TData.NamedDeviceArrayTuple{N, T, N, names}

                            const TensorField{T, N, names}        = TData.NamedArrayTuple{N, T, N, names}
                            const DeviceTensorField{T, N, names}  = TData.NamedDeviceArrayTuple{N, T, N, names}
                        end)
    end
    return prewalk(rmlines, flatten(Fields_module))
end


function Data_Fields_exprs()
    quote
        const Field                 = Data.Array
        const XField                = Data.Array
        const YField                = Data.Array
        const ZField                = Data.Array
        const BXField               = Data.Array
        const BYField               = Data.Array
        const BZField               = Data.Array
        const XXField               = Data.Array
        const YYField               = Data.Array
        const ZZField               = Data.Array
        const XYField               = Data.Array
        const XZField               = Data.Array
        const YZField               = Data.Array
        const DeviceField           = Data.DeviceArray
        const DeviceXField          = Data.DeviceArray
        const DeviceYField          = Data.DeviceArray
        const DeviceZField          = Data.DeviceArray
        const DeviceBXField         = Data.DeviceArray
        const DeviceBYField         = Data.DeviceArray
        const DeviceBZField         = Data.DeviceArray
        const DeviceXXField         = Data.DeviceArray
        const DeviceYYField         = Data.DeviceArray
        const DeviceZZField         = Data.DeviceArray
        const DeviceXYField         = Data.DeviceArray
        const DeviceXZField         = Data.DeviceArray
        const DeviceYZField         = Data.DeviceArray
    end
end
