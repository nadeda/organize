from pathlib import Path
from typing import ClassVar
from pydantic.config import ConfigDict
from pydantic.dataclasses import dataclass
from organize.filter import FilterConfig
from organize.output import Output
from organize.resource import Resource

@dataclass(config=ConfigDict(extra="forbid"))
class SubtitleMissing:
    """
    동영상 파일과 같은 이름의 .srt 또는 .smi 자막 파일이 없을 때만 True를 반환하는 필터
    """
    filter_config: ClassVar[FilterConfig] = FilterConfig(
        name="subtitle_missing",
        files=True,
        dirs=False,
    )

    def pipeline(self, res: Resource, output: Output) -> bool:
        assert res.path is not None, "Does not support standalone mode"
        if res.is_dir():
            return False
        base = res.path.with_suffix("")
        for ext in (".srt", ".smi"):
            if (base.with_suffix(ext)).exists():
                return False
        return True 