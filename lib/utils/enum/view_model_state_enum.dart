enum ViewModelStateEnum {
  idle,
  loading,
  error,
  loaded;

  get isLoading => this == loading;
  get isError => this == error;
  get isLoaded => this == loaded;
  get isIdle => this == idle;
}
